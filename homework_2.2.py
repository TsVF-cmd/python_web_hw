import pickle
import re
from abc import ABC, abstractmethod
from collections import UserDict
from datetime import datetime


class View(ABC):
    def __init__(self, new_record):
        self.record = new_record

    @abstractmethod
    def representation(self):
        pass


class ConsoleView(View, ABC):
    def representation(self):
        pass


class WebView(View, ABC):
    pass


class ModalView(View, ABC):
    pass


class IncorrectInput(Exception):
    pass


class AddressBook(UserDict):
    def add_record(self, record):
        self.data[record] = record

    def iterator(self, items_number):  # items_number - за одну итерацию возвращает представление для N записей
        counter = 0
        result = ""
        for name, record in self.data.items():
            result += str(record) + "\n"
            counter += 1
            if counter >= items_number:
                yield result
                counter = 0
                result = ""
        yield result

    def dump_address_book(self, address_book):
        with open(address_book, "wb") as file:
            pickle.dump(address_book, file)

    def load_address_book(self, address_book):
        try:
            with open(address_book, "rb") as file:
                return pickle.load(file)
        except FileNotFoundError:
            return AddressBook()

    def str_search(self, search_str: str):  # поиск строки
        result = {}
        for name, record in self.data.items():
            if search_str in record:
                result[name] = record
        return result


class Record:
    def __init__(self, name, phones=None, birthday=None):
        self.name = name
        self.birthday = birthday
        if phones is None:
            self.phones = []
        else:
            self.phones = phones

    def add_phone(self, phone):
        self.phones.append(phone)

    def remove_phone(self, phone):
        self.phones.remove(phone)

    def edit_phone(self, phone):
        pass

    def days_to_birthday(self):
        if not self.birthday:
            return
        now = datetime.today()
        if (self.birthday.value.replace(year=now.year) - now).days > 0:
            return (self.birthday.value.replace(year=now.year) - now).days
        return (self.birthday.value.replace(year=now.year + 1) - now).days


class Field:
    def __init__(self, value):
        self.__value = value

    @property
    def value(self):
        return self.__value

    @value.setter
    def value(self, value):
        self.__value = value

    def __str__(self):
        return f"{self.__class__.__name__}: {self.value}"


class Name(Field):
    pass


class Phone(Field):
    PHONE_REGEX = re.compile(r"^\+?(\d{2})?\(?(0\d{2})\)?(\d{7}$)")

    def __init__(self, value):
        super().__init__(value)
        self.country_code = ""
        self.operator_code = ""
        self.phone_number = ""

    def __repr__(self):
        return self.value

    @Field.value.setter
    def value(self, value: str):
        value = value.replace(" ", "")
        search = re.search(self.PHONE_REGEX, value)
        try:
            country, operator, phone = search.group(1, 2, 3)
        except AttributeError:
            raise IncorrectInput(f"No phone number found in {value}")

        if operator is None:
            raise IncorrectInput(f"Operator code not found in {value}")

        self.country_code = country if country is not None else "38"
        self.operator_code = operator
        self.phone_number = phone
        self.__value = f"+{self.country_code}({self.operator_code}){self.phone_number}"


class Birthday(Field):
    @Field.value.setter
    def value(self, value: str):
        self.__value = datetime.strptime(value, '%d%m%Y').date()
