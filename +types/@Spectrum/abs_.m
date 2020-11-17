function out = abs_(obj)
dtemp=abs(obj.data(find(obj.getdimvals("freq")>=0)));
dnames=obj.dimNames;
dvals=obj.getdimvals("freq");
dvals={dvals(obj.getdimvals("freq")>0)};
out=types.PowerSpectrum(dtemp,dnames,dvals);
end