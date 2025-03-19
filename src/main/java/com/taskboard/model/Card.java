package com.taskboard.model;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDateTime;

@Data
@Entity
public class Card {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String description;
    private LocalDateTime createdAt;
    private boolean isBlocked;
    private String blockReason;

    @ManyToOne
    @JoinColumn(name = "column_id", nullable = false)
    private Column column;
}