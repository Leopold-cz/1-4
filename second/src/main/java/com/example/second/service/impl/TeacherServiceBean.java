package com.example.second.service.impl;

//import com.example.second.dao.TeacherCopyDao;
import com.example.second.exception.CustomException;
import com.example.second.dao.TeacherDao;
import com.example.second.entity.Teacher;
import com.example.second.exception.Response;
import com.example.second.exception.ResultCodeEnum;
import com.example.second.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Service
@Transactional
public class TeacherServiceBean implements TeacherService {

    @Autowired
    private TeacherDao teacherDao;

//    @Autowired
//    private TeacherCountDao teacherCountDao;
//
//    @Autowired
//    TeacherCopyDao teacherCopyDao;

    public List<Teacher> findAllTeachers() {
        return this.teacherDao.findAllTeachers();
    }

    public List<String> errors(Teacher teacher){
        List<String> errors = new ArrayList<>();
        String name = teacher.getName();
        String phone = teacher.getPhone();
        Double height = teacher.getHeight();
        Double weight = teacher.getWeight();
        String identify = teacher.getIdentify();
        Integer new_age = teacher.getNew_age();
        String email = teacher.getMail();
        if(name.length()<2 || name.length()>8){
            errors.add("名字长度限制在2~8个字符，请重新输入！");
        }
        if(phone.length()!=11){
            errors.add("电话长度在11个字符，请重新输入！");
        }
        if(height>250 ||  height <100 ){
            errors.add("身高应该在100~200cm内，请重新输入！");
        }
        if(weight > 300 ||weight<50 ){
            errors.add("体重应该在50~300斤内，请重新输入！");
        }
        if(identify.length() != 18){
            errors.add("身份应为18位数字，请重新输入！");
        }
        if(new_age >120 || new_age <20){
            errors.add("年龄应在20~120岁内，请重新输入！");
        }

        if(email.matches("^[a-z0-9A-Z]+[- | a-z0-9A-Z ._]+@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\\\.)+[a-z]{2,}$")){
            errors.add("邮箱格式有误，请重新输入！");
        }
        return errors;
    }

    @Transactional
    public void addTeacher(Teacher teacher) {
        if(errors(teacher).size() > 0){
            throw new Response("-1",errors(teacher).toString());
        }else {
            this.teacherDao.addTeacher(teacher);
//        this.teacherCopyDao.addTeacher(teacher);
            Integer count = this.teacherDao.getCountTeachers();
            //没有加@Transactional注解，万一出现错误，新增人数会成功，但是学生表的总人数没有改变，出现了数据的不一致。
//        int x = 5 / 0;
//        this.teacherCountDao.addCount(count);
        }

    }

    public void deleteTeacherById(Long uid) {
        this.teacherDao.deleteTeacherById(uid);
        Integer count = this.teacherDao.getCountTeachers();
        //this.teacherCountDao.addCount(count);
    }


    public void updateTeacher(Teacher teacher) {
        if(errors(teacher).size() > 0){
            throw new Response("-1",errors(teacher).toString());
        }else {
            this.teacherDao.updateTeacher(teacher);
        }

    }

    public List<Teacher> findTeacherByName(String name) {
        return this.teacherDao.findTeacherByName(name);
    }

    public Integer deleteTeachersByIds(Integer[] ids) {
        return this.teacherDao.deleteTeachersByIds(ids);
    }

}
