function out = neq_(obj,B)
if isa(B, 'Container')
   dtemp=(obj.data~=B.data);
   out=types.Logical(dtemp,obj.dimNames,obj.dimVals);
else
   dtemp=(obj.data~=B);
   out=types.Logical(dtemp,obj.dimNames,obj.dimVals);
end
end
    