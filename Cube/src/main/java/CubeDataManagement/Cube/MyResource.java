package CubeDataManagement.Cube;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import model.Manager;
import pojo.Aggregates;

/**
 * Root resource (exposed at "myresource" path)
 */
@Path("/webservice")
public class MyResource {

    /**
     * Method handling HTTP GET requests. The returned object will be sent
     * to the client as "text/plain" media type.
     *
     * @return String that will be returned as a text/plain response.
     */
	@GET
	@Path("getaggregates/{dbName}")
    @Produces(MediaType.APPLICATION_JSON)
    public ArrayList<Aggregates> getAggregates(@PathParam("dbName")String dbName) throws Exception {
    	Manager mgr=new Manager();
    	ArrayList<Aggregates> agr=mgr.getAggregates(dbName);
    	return agr;
    }
	@GET
	@Path("facts/{dbName}")
    @Produces(MediaType.APPLICATION_JSON)
    public ArrayList<Aggregates> getfacts(@PathParam("dbName")String dbName) throws Exception {
    	Manager mgr=new Manager();
    	ArrayList<Aggregates> agr=mgr.getfacts(dbName);
    	return agr;
    }
	
	
	@POST 
    @Path("uploadxml/{filename}")
    @Produces(MediaType.TEXT_PLAIN)
    public String xmlupload(@PathParam("filename")String filename) {
        Manager mgr=new Manager();
        mgr.xmlupload(filename);
        return "helllo";
    }
    @POST 
    @Path("computelattice/{dbName}")
    @Produces(MediaType.TEXT_PLAIN)
    public String computelattice(@PathParam("dbName")String dbName) throws ParserConfigurationException, SAXException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Manager mgr=new Manager();
        mgr.createlattice(dbName);
        return "hello";
    }
    @POST 
    @Path("uploadcsv/{filename}/{dbName}")
    @Produces(MediaType.TEXT_PLAIN)
    public String csvupload(@PathParam("dbName")String dbName,@PathParam("filename")String filename) {
        Manager mgr=new Manager();
        mgr.csvupload(dbName,filename);
        return "hello";
    }
    @POST 
    @Path("fullcube/{dbName}")
    @Produces(MediaType.TEXT_PLAIN)
    public String fullcube(@PathParam("dbName")String dbName) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
        Manager mgr=new Manager();
        mgr.fullcube(dbName);
        return "hello";
    }
    
    @POST 
    @Path("iceberg/{dbName}/{aggr}/{thres}/{fact}")
    @Produces(MediaType.TEXT_PLAIN)
    public String iceberg(@PathParam("dbName")String dbName,@PathParam("aggr")String aggr,@PathParam("thres")String thres,@PathParam("fact")String fact) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
        Manager mgr=new Manager();
        mgr.iceberg(dbName,aggr,thres,fact);
        return "hello";
    }
}
