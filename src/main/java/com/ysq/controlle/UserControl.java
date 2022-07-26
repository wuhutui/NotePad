package com.ysq.controlle;
import com.ysq.domain.User;
import com.ysq.service.NoteService;
import com.ysq.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;


@RestController
@RequestMapping("/users")

public class UserControl {
    @Autowired
    private UserService userService;
    @Autowired
    private NoteService noteService;
    @PostMapping
    public Result saveuser(@RequestBody  User user) {
        boolean f =  userService.saveuser(user);
        return new Result(f,f ? Code.Save_OK:Code.Save_OR,f ? "注册成功":"注册失败");
    }


    @PostMapping  ("/check")
    public Result  checkbyaccount(String luaccount,String lpwd,HttpSession session) {
        String pwd = userService.selectpwdbyaccount(luaccount);
        int code;
        String msg;
        if (pwd == null){
             code = Code.CHECK_OR;
             msg = "该账号不存在";
            return new Result(lpwd,code,msg);
        }
        else {
            int uid = Integer.parseInt(userService.selectuidbyaccount(luaccount));
            session.setAttribute("loguid",uid);
            code = pwd.equals(lpwd) ? Code.CHECK_OK : Code.CHECK_OR;
            msg = pwd.equals(lpwd) ? "login..." : "密码错误，请重试";
            return new Result(lpwd, code, msg);
        }
    }

}
