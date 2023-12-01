answer = input("Expression:").strip().split()
answer[0] = float(answer[0])
answer[2] = float(answer[2])
match answer[1]:
    case '/': print(answer[0] / answer[2])
    case '+': print(answer[0] + answer[2])
    case '-': print(answer[0] - answer[2])
    case '*': print(answer[0] * answer[2])



