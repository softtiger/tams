package com.nytkm.tams.common;

import com.alibaba.excel.converters.Converter;
import com.alibaba.excel.enums.CellDataTypeEnum;
import com.alibaba.excel.metadata.GlobalConfiguration;
import com.alibaba.excel.metadata.data.ReadCellData;
import com.alibaba.excel.metadata.data.WriteCellData;
import com.alibaba.excel.metadata.property.ExcelContentProperty;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

/*
 * @author     chengYu
 * @date     2023/11/28
 * @describe
 */
public class LocalTimeConverter implements Converter<LocalTime> {

   @Override
   public Class supportJavaTypeKey(){
       return  LocalTime.class;
   }


 public CellDataTypeEnum supportExcelTypeKey(){
         return  CellDataTypeEnum.STRING;
  }

  @Override
 public LocalTime convertToJavaData(ReadCellData<?> cellData, ExcelContentProperty contentProperty,
                                    GlobalConfiguration GlobalConfiguration) throws Exception{
           return LocalTime.parse(cellData.getStringValue(), DateTimeFormatter.ofPattern("HH:mm"));
  }


  @Override
   public WriteCellData<?> convertToExcelData(LocalTime value, ExcelContentProperty contentProperty,
                                           GlobalConfiguration globalConfiguration) throws Exception {
       return new WriteCellData<>(value.format(DateTimeFormatter.ofPattern("HH:mm")));
  }
}
