function out = ifft_(obj)

dtemp=ifft(ifftshift(obj.data),'symmetric');
dnames={'time'};
dvals={[1:numel(obj.data)]};

out=types.NumericTimeSeries(dtemp,dnames,dvals);

end