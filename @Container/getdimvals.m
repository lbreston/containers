function out=getdimvals(obj,dname)
[~,I]=ismember(dname,obj.dimNames);
dv = obj.dimVals{I};
if isempty(dv)
    error("Dimension Does Not Exist")
else
    out = dv;
end
end

