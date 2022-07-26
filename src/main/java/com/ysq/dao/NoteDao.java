package com.ysq.dao;

import com.ysq.domain.Note;
import org.apache.ibatis.annotations.*;

import javax.print.DocFlavor;
import java.util.List;

public interface NoteDao {
    @Insert("insert into note(uid,nevent,nlevel,nday,nhour) values (#{uid},#{nevent},#{nlevel},#{nday},#{nhour})")
    public void savenote(Note note);
    @Update("update note set nevent = #{nevent}, nlevel=#{nlevel},nday=#{nday},nhour=#{nhour} where nid=#{nid}")
    public void updatenote(Note note);
    @Delete("delete from note where nid=#{nid}")
    public void deletnote(int nid);
    @Select("select * from note where nid=#{nid} ")
    public Note getbyId(int nid);
    @Select("select * from note where  uid=#{uid} and nlevel=#{nlevel} ")
    public List<Note> getbylevel(@Param("uid") int uid, @Param("nlevel")int nlevel);
    @Select("select nid from note where uid=#{uid} ")
    public List<Integer> getidbyId(int uid);
    @Select("select * from note where uid=#{uid}")
    public List<Note> getAll(int uid);
}
