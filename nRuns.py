import sys

#input = nRows
nRows = input()
nRows = float(nRows)
#print(nRows)

nReducedRows = nRows / 4 * 0.5

if nReducedRows % 4 != 0:
    nReducedRows = nReducedRows+1
    if nReducedRows % 4 != 0:
        nReducedRows = nReducedRows+1
        if nReducedRows % 4 != 0:
            nReducedRows = nReducedRows+1

nReducedRows = int(nReducedRows)
#print(nReducedRows)
sys.stdout.write(f"{nReducedRows}")
