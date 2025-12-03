package com.hmshop.backend.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "user_address")
@Data
@NoArgsConstructor
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    private String name;
    private String tel;
    private String country;
    private String province;
    private String city;
    private String county;
    private String areaCode;
    private String postalCode;
    private String addressDetail;
    private Boolean isDefault;
    private LocalDateTime addTime;
    private LocalDateTime updateTime;
    private Boolean deleted;
}
