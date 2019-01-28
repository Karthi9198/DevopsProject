package com.niit.shoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.shoppingbackend.dao.CategoryDAO;
import com.niit.shoppingbackend.dto.Category;

public class CategoryTestCase {

	private static AnnotationConfigApplicationContext context;
	private static CategoryDAO categoryDAO;
	@Autowired
	private Category category;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.shoppingbackend");
		context.refresh();
		categoryDAO = (CategoryDAO) context.getBean("categoryDAO");
	}

	/*	@Test
	public void testAddCategory() {
		
		category=new Category();
		
		category.setName("Novels");
		category.setDescription("Description forNovels");
		category.setImageURL("CAT_3.png");
		
		assertEquals("Successfully added a category in a table",true,categoryDAO.add(category));
		
	}*/
	
	/*@Test
	public void testGetCategory() {
		
		category=categoryDAO.get(3);
		assertEquals("Successfully fetched a single category from table","Novels",category.getName());
		
	}*/
	
	/*@Test
	public void testUpdateCategory() {
		
		category=categoryDAO.get(2);
		category.setName("Engg. Books");
		assertEquals("Successfully updated a single category in table",true,categoryDAO.update(category));	
	}*/
	/*@Test
	public void testDeleteCategory() {
		
		category=categoryDAO.get(2);
		
		assertEquals("Successfully delete single category in table",true,categoryDAO.delete(category));
	
	}*/
	/*@Test
	public void testListCategory() {
		
		assertEquals("Successfully fetched list of category in table",2,categoryDAO.list().size());
	
	}*/
	
	/*@Test
	public void testCRUDCategory() {
	
		//add operation
		category=new Category();
		
		category.setName("Comic Books");
		category.setDescription("Description for Comic books");
		category.setImageURL("CAT_1.png");
		
		assertEquals("Successfully added a category in a table",true,categoryDAO.add(category));
		
		category=new Category();
		
		category.setName("Engineering Books");
		category.setDescription("Description for Engineering books");
		category.setImageURL("CAT_2.png");
		
		assertEquals("Successfully added a category in a table",true,categoryDAO.add(category));
		
		//fetching and updating category
		category=categoryDAO.get(2);
		category.setName("Engg. Books");
		assertEquals("Successfully added a category in a table",true,categoryDAO.update(category));
	
		//delete category
		assertEquals("Successfully deleted a category in a table",true,categoryDAO.delete(category));
		//fetching list
		assertEquals("Successfully fetched list of category in table",1,categoryDAO.list().size());
		
	
	}

}
*/
	/*
	 * Testing all the CRUD operations on Category
	 */
	@Test
	public void testCRUDCategory() {

		// adding 3 Categories to Category table

		category = new Category();
		category.setName("Novels");
		category.setDescription("Some description for television");
		category.setImageURL("CAT_1.png");

		assertEquals("something went wrong when adding a new category", true, categoryDAO.add(category));

		category = new Category();
		category.setName("Engineering Books");
		category.setDescription("Some description for mobile");
		category.setImageURL("CAT_2.png");

		assertEquals("something went wrong when adding a new category", true, categoryDAO.add(category));

		category = new Category();
		category.setName("Comic Books");
		category.setDescription("Some description for laptop");
		category.setImageURL("CAT_3.png");

		assertEquals("something went wrong when adding a new category", true, categoryDAO.add(category));

		// Updating a Category

		category = categoryDAO.get(2);
		category.setName("Engg. Books");

		assertEquals("something went wrong when updating a category", true, categoryDAO.update(category));

		// Deleting a Category

		category = categoryDAO.get(3);
		assertEquals("something went wrong when deleting a category", true, categoryDAO.delete(category));

		// Retrieving all active categories

		assertEquals("something went wrong when retrieving the active categories", 2, categoryDAO.list().size());

	}
}
