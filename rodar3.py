

import os

for m in range(10, 101, 10):

	a = """param nDepositos := %d;
	param nClientes := %d;""" % (m, m/2)

	f = open("problema3.dat", "w")
	f.write(a);
	f.close()

	os.system("time ./ampl rodar3.txt")





