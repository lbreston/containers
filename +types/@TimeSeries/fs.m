function out = fs(obj)
times=getdimvals(obj,"time");
out=(numel(times)-1)/(max(times)-min(times));
end