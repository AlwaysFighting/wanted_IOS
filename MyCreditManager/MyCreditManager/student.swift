import Foundation

struct Student {
    var name: String
    var subject: [String]
    var grade: [String]
    var avg: Double
}

var students: [Student] = []

final class Students {
    
    func addStudent() {
        print("추가할 학생의 이름을 입력해주세요.")
        
        let inputStudent = String(readLine() ?? "")
        
        if inputStudent.isEmpty {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        } else {
            if students.contains(where: { $0.name == inputStudent }) {
                print("\(inputStudent)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            } else {
                students.append(Student(name: inputStudent, subject: [], grade: [], avg: 0))
                print("\(inputStudent) 학생을 추가했습니다.")
            }
        }
    }
    
    func deleteStudents() {
        print("삭제할 학생의 이름을 입력해주세요.")
        
        let inputStudent = String(readLine() ?? "")
        
        if inputStudent.isEmpty {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        } else {
            if let index = students.indices.filter({ students[$0].name == inputStudent }).first {
                students.remove(at: index)
                print("\(inputStudent) 학생 정보를 삭제했습니다.")
            } else {
                print("\(inputStudent) 학생을 찾을 수 없습니다.")
            }
        }
    }
    
    func addGrade() {
        print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재한다면 기존 점수가 갱신됩니다.")
        
        let input = readLine()?.split(separator: " ").map { String($0) }
        
        if let input = input, input.count >= 3 {
        
            let newName = input[0]
            let newSubject = input[1]
            let newGrade = input[2]
            
            if let index = students.firstIndex(where: { $0.name == newName }), students[index].subject.contains(newSubject) {
                print("\(newName)학생의 \(newSubject)과목이 \(newGrade)로 추가(변경)되었습니다.")
                students[index].subject = [newSubject]
                students[index].grade = [newGrade]
            } else if let index = students.firstIndex(where: { $0.name == newName }) {
                students[index].subject.append(newSubject)
                students[index].grade.append(newGrade)
                print("\(newName)학생의 \(newSubject)과목이 \(newGrade)로 추가(변경)되었습니다.")
            } else {
                print("\(newName) 학생을 찾지 못했습니다.")
            }
        } else {
            print("입력이 잘못되었습니다.")
        }
    }
    
    func deleteGrade(){
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift")
        
        let input = readLine()?.split(separator: " ").map { String($0) }
        
        if let input = input, input.count >= 2 {
            
            let newName = input[0]
            let newSubject = input[1]
            
            if let index = students.firstIndex(where: { $0.name == newName }) {
                if let subjectIndex = students[index].subject.firstIndex(of: newSubject) {
                    students[index].subject.remove(at: subjectIndex)
                    students[index].grade.remove(at: subjectIndex)
                    print("\(newName) 학생의 \(newSubject) 과목의 성적이 삭제되었습니다.")
                } else {
                    print("\(newSubject) 과목을 찾지 못했습니다.")
                }
            } else {
                print("\(newName) 학생을 찾지 못했습니다.")
            }
        } else {
            print("입력이 잘못되었습니다.")
        }
    }
    
    func showAvg() {
        print("평점을 알고 싶은 학생의 이름을 입력해주세요")
        
        var gradeArray = [String]()
        let input = String(readLine() ?? "")
        
        if input.isEmpty {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        } else {
            if let index = students.indices.filter({ students[$0].name == input }).first {
                gradeArray = []
                
                for i in 0..<students[index].subject.count {
                    print("\(students[index].subject[i]) : \(students[index].grade[i])")
                    gradeArray.append(String(students[index].grade[i]))
                }
                
                let gradeAvg = Double(GradeCat(in: gradeArray)) / Double(students[index].subject.count)
                print("평점 : \(String(format: "%.2f", gradeAvg))")
            } else {
                print("\(input) 학생을 찾지 못했습니다.")
            }
        }
    }
    
    func GradeCat(in array: [String]) -> Double {
        
        var sum : Double = 0.0
        
        for element in array {
            switch (element) {
            case "A+" :
                sum += 4.5
            case "A" :
                sum += 4.0
            case "B+" :
                sum += 3.5
            case "B" :
                sum += 3.0
            case "C+" :
                sum += 2.5
            case "C" :
                sum += 2.0
            case "D+" :
                sum += 1.5
            case "D" :
                sum += 1.0
            default:
                sum += 0
            }
        }
        return sum
    }
}


