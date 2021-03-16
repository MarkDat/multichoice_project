package com.wild.utils;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.wild.models.Question;

public class ReadWriteExcel {
	
	public List<Question> readFile(String path) {
		List<Question> qs = new ArrayList<Question>();
		try {
	        FileInputStream file = new FileInputStream(new File(path));

	        //Create Workbook instance holding reference to .xlsx file
	        XSSFWorkbook workbook = new XSSFWorkbook(file);

	        //Get first/desired sheet from the workbook
	        XSSFSheet sheet = workbook.getSheetAt(0);

	        //Iterate through each rows one by one
	        Iterator<Row> rowIterator = sheet.iterator();
	        
	        while (rowIterator.hasNext())
	        {
	            Row row = rowIterator.next();
	            //For each row, iterate through all the columns
	            Iterator<Cell> cellIterator = row.cellIterator();
	            int countCell = 0;
	            Question q = new Question();
	            while (cellIterator.hasNext()) 
	            {
	                Cell cell = cellIterator.next();
	                //Check the cell type and format accordingly
	                switch (cell.getCellType()) 
	                {
	                    case Cell.CELL_TYPE_NUMERIC:
	                       // System.out.print(cell.getNumericCellValue() + "\t");
	                        switch (countCell) {
							case 0: q.setContent(cell.getNumericCellValue()+""); break;
							case 1: q.setRsA(cell.getNumericCellValue()+""); break;
							case 2: q.setRsB(cell.getNumericCellValue()+"");break;
							case 3: q.setRsC(cell.getNumericCellValue()+"");break;
							case 4: q.setRsD(cell.getNumericCellValue()+"");break;
							case 5: q.setRs(cell.getNumericCellValue()+"");break;

							default: System.out.println("ERR");
								break;
							}
	                        break;
	                    case Cell.CELL_TYPE_STRING:
	                       // System.out.print(cell.getStringCellValue() + "\t");
	                        switch (countCell) {
							case 0: q.setContent(cell.getStringCellValue()); break;
							case 1: q.setRsA(cell.getStringCellValue()); break;
							case 2: q.setRsB(cell.getStringCellValue());break;
							case 3: q.setRsC(cell.getStringCellValue());break;
							case 4: q.setRsD(cell.getStringCellValue());break;
							case 5: q.setRs(cell.getStringCellValue());break;

							default: System.out.println("ERR");
								break;
							}
	                        break;
	                }
	               
	                countCell++;
	            }
	            qs.add(q);
	            System.out.println("");
	        }
	        file.close();
	        qs.remove(0);
	        return qs;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
}
