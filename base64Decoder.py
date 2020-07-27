"""
Name: Shourya Raj
Email: sraj0008@student.monash.edu
"""



class coder:
    def __init__(self):
        # Initializing the values of the standard Encoded characters
        letters = "".join([
            "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
            "abcdefghijklmnopqrstuvwxyz",
            "0123456789+/",
        ])
        # ziping in the Dictionary having key as char with the value of range i.e, index number of each characters
        self.char2N = dict(zip(letters, range(len(letters))))


    def base64Decorder(self, code):
        """
        It converts only non-padded value
        :param code:  There is no need for the parameter it should ask from the terminal
        :return: Return the decoded string
        """

        sixBitsLongeach = ""
        # check = ''
        for char in code:
            numericalValue = self.char2N[char]
            # {0:b} for the binary format and 06 for the number of the bits
            binaryValue = '{0:06b}'.format(numericalValue)
            # print(binaryValue)
            sixBitsLongeach += str(binaryValue)
            # check += str(binaryValue)+'////'

        # print(check)

        #Split into eight bits
        eightBitsLongEach = ""
        resultOfDecoded = ''
        j=0
        left = 0
        right = 8
        # Using two pointers to get the eight bytes and converting into Ascii values
        while right <= len(sixBitsLongeach):
            # Getting the Eight bytes {Left.......Right (total => 8)}
            byte = sixBitsLongeach[left:right]
            # Converting the value into int with base of 2
            char = chr(int(byte, 2))
            # adding the Result to the string
            resultOfDecoded += char
            # Shifting the left pointer at the position of the right pointer
            left = right
            # Shifting the Right by 8 bytes
            right += 8

        print(resultOfDecoded)
        return resultOfDecoded
# print(char2N)

coder  = coder()
stop = False

while not stop:
    print("Enter the Encoded value:  ")
    code = input()
    coder.base64Decorder(code)
    if input() == 'end':
        stop = True

# KGl0J3Mp

# while len(sixBitsLongeach) >= 8:
#         #     byte = sixBitsLongeach[0:8]
#         #     char = chr(int(byte, 2))
#         #     resultOfDecoded += char
#         #     sixBitsLongeach = sixBitsLongeach[8:]
# Using Two Pointer