#1178
class Solution:
    """
    @param s: a string
    @return: whether the student could be rewarded according to his attendance record
    """
    def checkRecord(self, s):
        # Write your code here
        if s.count('A')>1 or s.count('LLL')>0:return False
        else:return True