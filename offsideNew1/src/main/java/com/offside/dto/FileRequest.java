package com.offside.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
public class FileRequest {

    private Long id;                // 파일 번호 (PK)
    private Long matchId;            // 게시글 번호 (FK)
    private String originalName;    // 원본 파일명
    private String saveName;        // 저장 파일명
    private long imgSize;              // 파일 크기

    @Builder
    public FileRequest(String originalName, String saveName, long imgSize) {
        this.originalName = originalName;
        this.saveName = saveName;
        this.imgSize = imgSize;
    }

    public void setPostId(Long matchId) {
        this.matchId = matchId;
    }

}