/* Class Manager.  Supposed to a subset of Worker.  

Open-Close Principle: if we added a new position to basic worker,
such as Manager or Auditor, we could simply extend existing code, rather than
modifying the Worker class itself.

Inteface Segragation:  The manager class would have tasks specific to the duties
of management, rather than just cramming manager methods into the Worker class,
which non-manager workers would not use.

Single Responsibility:  the developer-oriented counterpart to Interface
Segregation.  Again, the Manager class would focus exlusively on managerial
duties and the programmed implementations of those duties.

*/

package threesolid;

public class Manager {
	IWorker worker;

	public void Manager() {

	}
	public void setWorker(IWorker w) {
		worker=w;
	}

	public void manage() {
		worker.work();
	}
}