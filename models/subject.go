package models

import (
	"github.com/astaxie/beego/orm"
	"strings"
)

type Subject struct {
	Id int
	Option string
	AnswerKey string
	Status int8
	Img string
}

func init() {
	orm.RegisterModel(new(Subject))
}

func GetSubject(id int) (s Subject, err error) {
	o := orm.NewOrm()
	o.Using("guess")
	s = Subject{Id:id}
	err = o.Read(&s)

	if err != nil {
		return s, err
	}
	return
}

func Answer(sid int, answerkey string) bool {
	subject, err := GetSubject(sid)

	if err != nil {
		return  false
	}
	return strings.Compare(strings.ToUpper(answerkey), subject.AnswerKey) == 0
}
