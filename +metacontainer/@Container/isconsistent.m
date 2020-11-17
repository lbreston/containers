function out = isconsistent(obj)
if numel(obj)<=1
    out = true;
    return
end
if isequaln(obj.dimNames)
    if isequaln(obj.dimVals)
        out=true;
    else
        out = false;
    end
else
    out = false;
end

end