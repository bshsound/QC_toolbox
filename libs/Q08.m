% Quality Check 08: Check if recording suffers from DC-offset :(

function [flag] = Q08(meanv)
%     idx = find(Q2==1, 1, 'last' );
%     flag(1:idx) = 1;
%     if ~isempty(idx)
%         ref = meanv(idx+1);
%     else
%         ref = meanv(1);
%         idx=0;
%     end
% %     lincf = 6.949771570815150e+08;
%     for ff=idx+1:length(meanv)
%         drift = abs(uPa2dB(abs(ref))-uPa2dB(abs(meanv(ff))));
%         if drift > limit
%             flag(ff)=1;
%         else
%             flag(ff)=0;
%         end
%     end

flag = double(isoutlier(meanv,'mean'));

end


% %% TEST
% 
% plot(meanv)
% hold on
% plot(meanv+std(meanv),'r')
% plot(meanv-std(meanv),'r')
% 
% find(meanv > meanv+std(meanv) | meanv < meanv-std(meanv))

