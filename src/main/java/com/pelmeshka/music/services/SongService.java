package com.pelmeshka.music.services;

import com.pelmeshka.music.models.Song;
import com.pelmeshka.music.repositories.SongRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class SongService {
    private final SongRepository songRepository;

    public List<Song> getAllSongs() {
        return songRepository.findAll();
    }

    public Song getSongById(Long id) {
        return songRepository.findById(id).orElse(null);
    }

    public void addSong(MultipartFile file, String artist, String title) throws IOException {
        Song song = new Song();
        song.setArtist(artist);
        song.setTitle(title);
        song.setOriginalFileName(file.getOriginalFilename());
        song.setContentType(file.getContentType());
        song.setSize(file.getSize());
        song.setBytes(file.getBytes());
        songRepository.save(song);
    }

    public void deleteSongById(Long id) {
        songRepository.deleteById(id);
    }
}