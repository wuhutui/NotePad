package com.ysq.service;

import com.ysq.domain.Note;

import java.util.List;

public interface NoteService {

    public boolean savenote(Note note);

    public boolean updatenote(Note note);

    public boolean deletnote(int nid);

    public Note getbyId(int nid);

    public List<Note> getbylevel(int uid, int nlevel);

    public List<Note> getAll(int uid);

    public List<Integer> getidbyId(int uid);


}
