# Напишите классы сериализации контейнеров с данными Python в json, bin файлы. Сами классы должны соответствовать
# общему интерфейсу (абстрактному базовому классу) SerializationInterface.


from abc import ABC, abstractmethod
import pickle
import json


class SerializationInterface(ABC):

    @abstractmethod
    def serialize_data(self, data, path):
        pass

    @abstractmethod
    def deserialize_data(self, path):
        pass


class SerializeToJson(SerializationInterface):

    def serialize_data(self, data, path):
        with open(path, 'w') as fh:
            json.dump(data, fh)

    def deserialize_data(self, path):
        with open(path, 'r') as fh:
            data = json.load(fh)
        return data


class SerializeToBin(SerializationInterface):

    def serialize_data(self, data, path):
        with open(path, 'wb') as fh:
            pickle.dump(data, fh)

    def deserialize_data(self, path):
        with open(path, 'rb') as fh:
            data = pickle.load(fh)
        return data
