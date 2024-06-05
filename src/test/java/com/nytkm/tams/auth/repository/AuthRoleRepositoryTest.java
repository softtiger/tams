package com.nytkm.tams.auth.repository;

import com.nytkm.tams.auth.domain.AuthRole;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

/*
 * @author     chengYu
 * @date     2023/10/31
 * @describe
 */

@SpringBootTest
class AuthRoleRepositoryTest {

     @Autowired
     private AuthRoleRepository authRoleRepository;

     @Test
      @Transactional(readOnly = true)
      public void testRelation(){
        Optional<AuthRole>  optionalAuthRole = authRoleRepository.findById(1);
        if (optionalAuthRole.isPresent()){
            optionalAuthRole.get().getAuthRolePermissionList().forEach(System.out::println);
        }

     }

     @Test
     public void testCalendar(){
         LocalDate  belongMonth = LocalDate.now();
         LocalDate beginOfRange = belongMonth.with(TemporalAdjusters.firstDayOfMonth()).with(DayOfWeek.MONDAY);

         LocalDate lastOfRnage = belongMonth.with(TemporalAdjusters.lastDayOfMonth()).with(DayOfWeek.SUNDAY);


     }

}