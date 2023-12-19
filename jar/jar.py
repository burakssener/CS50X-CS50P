class Jar:
    def __init__(self, capacity=12):
        self.capacity = capacity

    def __str__(self):
        return f"{self.capacity}"

    def deposit(self, n):
        self.size += n

    def withdraw(self, n):
        self.size

    @property
    def capacity(self):
        return self._capacity


    @capacity.setter
    def capacity(self, capacity):
        self._capacity = capacity

    @property
    def size(self):
        return self._size

    @size.setter
    def size(self, size):
        self._size = size


cookie = Jar(12)

print(cookie)


