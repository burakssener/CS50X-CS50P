class Jar:
    def __init__(self, capacity=12):
        self.capacity = capacity

    @property
    def capacity(self):
        return self._capacity


    @capacity.setter
    def capacity(self, capacity):
        return self._capacity


cookie = Jar(12)


