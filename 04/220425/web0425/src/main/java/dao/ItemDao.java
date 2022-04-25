package dao;

import java.util.ArrayList;
import java.util.List;

import vo.Item;

public class ItemDao {
	public List<Item> selectItemListAll() {
		List<Item> list = new ArrayList<>();
		list.add(new Item(1, "라면", 4000));
		list.add(new Item(2, "우동", 6000));
		list.add(new Item(3, "짜장면", 5000));
		list.add(new Item(4, "김밥", 3000));
		list.add(new Item(5, "짬뽕", 7000));
		return list;
	}
}
