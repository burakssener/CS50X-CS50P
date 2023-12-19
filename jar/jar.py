class Jar:
    def __init__(self, capacity=12):
        self.capacity = capacity

    def __str__(self):
        return (f"🍪" * self.size)

    def deposit(self, n):
        self.size += n


    def withdraw(self, n):
        self.size -= n

    @property
    def capacity(self):
        return self._capacity


    @capacity.setter
    def capacity(self, capacity):
        self._capacity = capacity
        self._size = 0

    @property
    def size(self):
        return self._size

    @size.setter
    def size(self, size):
        if size <= self.capacity and size >= 0:
            self._size = size
        else:
            raise ValueError


