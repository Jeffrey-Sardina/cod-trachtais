import org.apache.jena.riot.RDFDataMgr;
import org.apache.jena.query.Dataset;
import org.apache.jena.riot.Lang;

public class Go_NT 
{
    public static void main(String[] args) 
    {
        Dataset dataset = RDFDataMgr.loadDataset("triail.nq");
        RDFDataMgr.write(System.out, dataset, Lang.NTRIPLES);
    }
}
