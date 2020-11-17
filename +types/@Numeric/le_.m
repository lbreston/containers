function out = le_(obj,B)
if isa(B, 'metacontainer.Container')
   dtemp=(obj.data<=B.data);
   out=types.Logical(dtemp,obj.dimNames,obj.dimVals);
else
   dtemp=(obj.data<=B);
   out=types.Logical(dtemp,obj.dimNames,obj.dimVals);
end
end
    