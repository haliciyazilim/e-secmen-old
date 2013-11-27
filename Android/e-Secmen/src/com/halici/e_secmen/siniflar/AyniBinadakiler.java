package com.halici.e_secmen.siniflar;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AyniBinadakiler {

	private String gelenVeri;
	
	// JSON Nodları
	private static String ayniAdrestekiler="AyniBinadaOyKullananlar";
	private static String ad="Adi";
	private static String soyad="Soyadi";
	private static String kapiNo="Daire";

	public AyniBinadakiler(String gelenVeri) {
		super();
		this.gelenVeri = gelenVeri;
	}
	
	
	public ArrayList<HashMap<String, String>> veriAl(){
		
		ArrayList<HashMap<String, String>> bilgiler=new ArrayList<HashMap<String, String>>();
		 
		try {
			JSONObject json= new JSONObject(this.gelenVeri);
			JSONArray binaBilgisiArray=json.getJSONArray(ayniAdrestekiler);
			
//			System.out.println("Ayni B�nadakiler B�na B�lgisi Array: "+binaBilgisiArray);
			
			
			String isim, soyisim, kapiNumarasi;
			
			isim=binaBilgisiArray.getJSONObject(0).getString(ad).toString();
			soyisim=binaBilgisiArray.getJSONObject(0).getString(soyad).toString();
			kapiNumarasi=binaBilgisiArray.getJSONObject(0).getString(kapiNo).toString();
			
//			System.out.println("Ayni B�nadakiler B�na B�lgisi icerik:  "+isim+" "+soyisim+" "+kapiNumarasi);
			
			for(int i=0; i<binaBilgisiArray.length();i++){
				
				HashMap<String, String> map=new HashMap<String, String>();
				
				isim=binaBilgisiArray.getJSONObject(i).getString(ad).toString();
				soyisim=binaBilgisiArray.getJSONObject(i).getString(soyad).toString();
				kapiNumarasi=binaBilgisiArray.getJSONObject(i).getString(kapiNo).toString();
				
				
				if(kapiNumarasi==String.valueOf(0))
					kapiNumarasi="-";
					
				
				map.put("isim", isim+" "+soyisim);
				
				map.put("kapiNo", kapiNumarasi);
				bilgiler.add(map);
			}
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return bilgiler;
	}
	
	
//	public ArrayList<String> veriAl(){
//		ArrayList<String> bilgiler=new ArrayList<String>();
//		
//		 
//		try {
//			JSONObject json= new JSONObject(this.gelenVeri);
//			JSONArray binaBilgisiArray=json.getJSONArray(ayniBinadakiler);
//			
//			String isim, soyisim;
//			for(int i=0; i<binaBilgisiArray.length();i++){
//				isim=binaBilgisiArray.getJSONObject(i).getString(ad).toString();
//				soyisim=binaBilgisiArray.getJSONObject(i).getString(soyad).toString();
//				
//				bilgiler.add(isim+" "+soyisim);
//			}
//			
//
//			
//			System.out.println("Ayni Binadakiler"+bilgiler.get(0));
//			
//			
//		} catch (JSONException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return bilgiler;
//	}
	
	
}
