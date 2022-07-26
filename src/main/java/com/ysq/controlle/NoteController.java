
package com.ysq.controlle;

import com.ysq.domain.Note;
import com.ysq.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/notes")
public class NoteController {
    @Autowired
    private NoteService noteService;

    @PostMapping
    public Result savenote(@RequestBody Note note) {
       boolean f = noteService.savenote(note);
       int code = f ? Code.Save_OK:Code.Save_OR;
       String msg = f ? "success":"failed";
        return new Result(f,code,msg);
    }

    @PutMapping ("/update")
    public Result updatenote(@RequestBody Note note) {
            boolean f = noteService.updatenote(note);
            return new Result(f,f ? Code.UPDATA_OK:Code.UPDATA_OR,f ? "更新成功":"更新失败");
    }

    @DeleteMapping( "/del/{nid}")
    public Result deletnote(@PathVariable int nid , HttpSession session) {
       Note temnote = noteService.getbyId(nid);
       if (temnote !=null){
        int loguid = (int) session.getAttribute("loguid");
        int datauid = temnote.getUid();
       if (loguid == datauid){
            boolean f =  noteService.deletnote(nid);
            return new Result(f,f ? Code.DELET_OK:Code.DELET_OR,f ? "删除成功":"删除失败");}
       else
           return new Result(" ",Code.DELET_OR,"无权限");
    }
    else {
            return new Result(" ",Code.DELET_OR,"记录不存在");
       }
       }



    @GetMapping(name ="/{nlevel}/{uid}")
    public Result getbylevel(@PathVariable int uid, @PathVariable int nlevel) {
        List<Note>notes = noteService.getbylevel(uid, nlevel);
        int code =  notes !=null ? Code.SELECT_OK : Code.SELECT_OR;
        String msg = notes !=null ? "查询成功":"数据查询失败";

        return new Result(notes,code,msg);
    }
    @GetMapping("getone/{nid}")
    public Result getbyId(@PathVariable int nid,HttpSession session) {
        Note noteid = noteService.getbyId(nid);
        int uid = (int) session.getAttribute("loguid");
        int code;
        String msg;
        if (noteid == null) {
            code = Code.SELECT_OR;
            msg = "查询失败，记录不存在";
            return new Result(noteid, code, msg);
        } else {
            code = Code.SELECT_OK;
            msg = "查询到" + nid + "号数据";
            if (noteid.getUid() == uid) {
                return new Result(noteid, code, msg);
            } else {
                return new Result(" ", Code.SELECT_OR, "不具有权限");
            }
        }
    }


    @GetMapping("/{uid}")
    public Result getAll(@PathVariable int uid) {
        List<Note>notes2 =  noteService.getAll(uid);
        int code =  notes2 !=null ? Code.SELECT_OK : Code.SELECT_OR;
        String msg = notes2 !=null ? "数据查询成功":"数据查询失败";
        return new Result(notes2,code,msg);
    }
}

