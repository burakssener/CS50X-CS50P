answer = input("File name:").strip().lower().split(".")

dict = {'gif':'image/gif', 'jpg':'image/jpeg', 'jpeg':'image/jpeg', 'png':'image/png', 'pdf':'application/pdf', 'txt':'text/plain', 'zip':'application/zip'}

if answer[-1] in dict.keys():
    print(dict[answer[-1]])
else:
    print("application/octet-stream")
