
def get_duplicate():
    nums = [1 , 2, 3, 4, 5, 3]
    nums2 = []
    for num in nums:
        nums2.append(num)
        for num2 in nums2:
            if num2 == num:
                return True
            return False
print(get_duplicate())