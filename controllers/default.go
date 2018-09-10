package controllers

import (
	"github.com/astaxie/beego"
	"guess/models"
	"github.com/pkg/errors"
	"encoding/json"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	var subject models.Subject
	err := func() error {
		id, err := c.GetInt("id")
		beego.Info(id)
		if err != nil {
			id = 1
		}
		subject, err = models.GetSubject(id)
		if err != nil {
			return errors.New("subject not exist")
		}
		return nil
	}()

	if err != nil {
		c.Ctx.WriteString("wrong params")
	}

	var option map[string]string
	if err = json.Unmarshal([]byte(subject.Option), &option); err != nil {
		c.Ctx.WriteString("wrong params, json decode")
	}
	c.Data["ID"] = subject.Id
	c.Data["Option"] = option
	c.Data["Img"] = "/static" + subject.Img
	c.TplName = "guess.tpl"
}


func (c *MainController) Post() {
	var subject models.Subject
	err := func() error {
		id, err := c.GetInt("id")
		beego.Info(id)
		if err != nil {
			id = 1
		}
		subject, err = models.GetSubject(id)
		if err != nil {
			return errors.New("subject not exist")
		}
		return nil
	}()

	if err != nil {
		c.Ctx.WriteString("wrong params")
	}
	answer := c.GetString("key")
	right := models.Answer(subject.Id, answer)

	c.Data["Right"] = right
	c.Data["Next"] = subject.Id + 1
	c.Data["ID"] = subject.Id
	c.TplName = "guess.tpl"
}

