
def get_duplicate():
    nums = [1 , 2, 3, 4, 5, 3]
    nums2 = []
    duplic = []
    for num in nums:
        if num != nums2 in duplic:
            duplic.append(num)
        else:
            return True
    return False
print(get_duplicate())