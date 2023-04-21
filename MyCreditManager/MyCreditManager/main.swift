import Foundation

class Start {
    func main() {
        
        let student = Students()

        while(true) {
            print("원하는 기능을 입력해주세요.")
            print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
            
            let input = String(readLine() ?? "")
            
            switch input {
            case "1":
                student.addStudent()
                break
            case "2":
                student.deleteStudents()
                break
            case "3":
                student.addGrade()
                break
            case "4":
                student.deleteGrade()
                break
            case "5":
                student.showAvg()
                break
            case "X":
                exit(0)
                break
            default:
                print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
            }
        }
    }
}

let start = Start()
start.main()
