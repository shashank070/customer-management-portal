package com.crm.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import com.crm.controller.Login;
import com.crm.vo.CustomerDetail;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class SendRequest {

	
	public static void sendPostRequest(CustomerDetail customerDetail,String token)
	{
		Gson gson = new Gson();
		String appuri=Login.properties.getProperty("appuri");
		String json= gson.toJson(customerDetail);
		System.out.println(json);

		  try {
			System.out.println("POSTING AT"+ appuri+"/add-customer");
			URL url = new URL(appuri+"/add-customer");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("content-type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setRequestProperty("Authorization", token);

			OutputStream os = conn.getOutputStream();
			os.write(json.getBytes());
			os.flush();
			

			BufferedReader br = new BufferedReader(new InputStreamReader(
					(conn.getInputStream())));

			String output;
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				System.out.println(output);
			}

			conn.disconnect();

		  } catch (MalformedURLException e) {

			e.printStackTrace();

		  } catch (IOException e) {

			e.printStackTrace();

		  }
	
		
		
	}
	
	public static List<CustomerDetail> sendGetRequest(String token)
	{
		System.out.println(token);
		List<CustomerDetail>  customerList= new ArrayList<CustomerDetail>();
		Gson gson = new Gson();
		String appuri=Login.properties.getProperty("appuri");

		  try {
			System.out.println("GET AT"+ appuri+"/get-customer-list");
			URL url = new URL(appuri+"/get-customer-list");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("GET");
			//conn.setRequestProperty("content-type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setRequestProperty("Authorization", token);
			

			BufferedReader br = new BufferedReader(new InputStreamReader(
					(conn.getInputStream())));

			String output;
			String json="";
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				json=json+output;
				System.out.println(json);
			}
			Type founderListType = new TypeToken<List<CustomerDetail>>(){}.getType();
			customerList=gson.fromJson(json, founderListType);
			
			conn.disconnect();

		  } catch (MalformedURLException e) {

			e.printStackTrace();

		  } catch (IOException e) {

			e.printStackTrace();

		  }
	
		
		return customerList;
		
	}
	
	public static  CustomerDetail sendGetRequestWithId(String id,String token)
	{

		System.out.println(token);
		CustomerDetail  customerDetail= null;
		Gson gson = new Gson();
		String appuri=Login.properties.getProperty("appuri");

		  try {
			System.out.println("GET AT"+ appuri+"/get-customer?customerId="+id);
			URL url = new URL(appuri+"/get-customer?customerId="+id);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("GET");
			//conn.setRequestProperty("content-type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setRequestProperty("Authorization", token);
			

			BufferedReader br = new BufferedReader(new InputStreamReader(
					(conn.getInputStream())));

			String output;
			String json="";
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				json=json+output;
				System.out.println(json);
			}
			customerDetail=gson.fromJson(json, CustomerDetail.class);
			
			conn.disconnect();

		  } catch (MalformedURLException e) {

			e.printStackTrace();

		  } catch (IOException e) {

			e.printStackTrace();

		  }

		return customerDetail;
		
	}
	
	public static void sendPutRequest(CustomerDetail customerDetail,String token)
	{

		Gson gson = new Gson();
		String appuri=Login.properties.getProperty("appuri");
		String json= gson.toJson(customerDetail);
		System.out.println(json);

		  try {
			System.out.println("PUTTING AT"+ appuri+"/update-customer");
			URL url = new URL(appuri+"/update-customer");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("PUT");
			conn.setRequestProperty("content-type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setRequestProperty("Authorization", token);

			OutputStream os = conn.getOutputStream();
			os.write(json.getBytes());
			os.flush();
			

			BufferedReader br = new BufferedReader(new InputStreamReader(
					(conn.getInputStream())));

			String output;
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				System.out.println(output);
			}

			conn.disconnect();

		  } catch (MalformedURLException e) {

			e.printStackTrace();

		  } catch (IOException e) {

			e.printStackTrace();

		  }
	
		
		
	
	}
	
	public static void sendDeleteRequest(String token, String[] custometIdArr)
	{

		Gson gson = new Gson();
		String appuri=Login.properties.getProperty("appuri");
		String json= gson.toJson(custometIdArr);
		System.out.println(json);

		  try {
			System.out.println("PUTTING AT"+ appuri+"/update-customer");
			URL url = new URL(appuri+"/update-customer");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("DELETE");
			conn.setRequestProperty("content-type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setRequestProperty("Authorization", token);

			OutputStream os = conn.getOutputStream();
			os.write(json.getBytes());
			os.flush();

			BufferedReader br = new BufferedReader(new InputStreamReader(
					(conn.getInputStream())));

			String output;
			//System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				System.out.println(output);
			}
			conn.disconnect();

		  } catch (MalformedURLException e) {

			e.printStackTrace();

		  } catch (IOException e) {

			e.printStackTrace();

		  }
	}
	
	public static boolean checkTokenAuthentication(String token)
	{

		  try {

			URL url = new URL("https://3qximwmswd.execute-api.ap-southeast-1.amazonaws.com/CRMSTAGE/authentication");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Accept", "application/json");
			conn.setRequestProperty("Authorization", token);
		
			
			
			if (conn.getResponseCode() == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(
						(conn.getInputStream())));

					String output;
					
					while ((output = br.readLine()) != null) {
						System.out.println(output);
					}
					conn.disconnect();

				return true;
				
			}else if(conn.getResponseCode() ==  401)
			{
				return false;
			}else
			{
				throw new RuntimeException("Failed : HTTP error code : "
						+ conn.getResponseCode());
			
			}

		  } catch (MalformedURLException e) {

			e.printStackTrace();

		  } catch (IOException e) {

			e.printStackTrace();

		  }
		return false;
	}

	
	
}
