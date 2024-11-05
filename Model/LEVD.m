function complexNum = LEVD(seg_i,seg_q)
% std_v = std(segment);
% [pks,locs] = findpeaks(segment);
% pks1 = islocalmin(segment);
% max = locs;
% min = find(pks1 == 1);
% E_mm = sort([max,min]);
% Sta = zeros(1,length(segment));
% n = 2;
% for i = 2:length(segment)
%     if ~isempty(find(E_mm == i))
%         n = n + 1;
%         if n >= 100
%            break; 
%         end
%     end
% %     if abs(segment(E_mm(n-1))-segment(E_mm(n))) >= std_v
%         Sta(i) = 0.9 * Sta(i-1) + 0.1 * 0.5 * (segment(E_mm(n-1))+segment(E_mm(n)));
% %     end
% end
% figure;
% plot(Sta)
% hold on 
% plot(segment)
% plot(segment - Sta)
% dyn_seg = segment - Sta;
xx = 1:1:length(seg_i);
% figure;
% plot(seg_i,'r'); hold on;
% plot(seg_q,'b');
[pks_i,locs_i] = findpeaks(seg_i);
vys_i = islocalmin(seg_i);
min_i = find(vys_i == 1);
[pks_q,locs_q] = findpeaks(seg_q);
vys_q = islocalmin(seg_q);
min_q = find(vys_q == 1);
yyu_i = spline(locs_i,pks_i,xx);
% plot(yyu_i,'--r')
yyl_i = spline(min_i,seg_i(min_i),xx);
% plot(yyl_i,'--r')
mean_i = 0.5*(yyu_i + yyl_i);
% plot(mean_i,'-.r')
sta_rm_i = seg_i - mean_i;
% plot(sta_rm_i,'.r')
yyu_q = spline(locs_q,pks_q,xx);
% plot(yyu_q,'--b')
yyl_q = spline(min_q,seg_q(min_q),xx);
% plot(yyl_q,'--b')
mean_q = 0.5*(yyu_q + yyl_q);
% plot(mean_q,'-.b')
sta_rm_q = seg_q - mean_q;
% plot(sta_rm_q,'.b')
% legend('I raw','Q raw','I upper envelope','I lower envelope','I mean','I without static','Q upper envelope','Q lower envelope','Q mean','Q without static');
% figure
% plot(sta_rm_i(48001:96000),sta_rm_q(48001:96000))
complexNum = sta_rm_i+j*sta_rm_q;
% figure, 
% % hold on
% plot(linspace(1,11,528000),phase(complexNum(1:528000))/(2*pi))
% % figure, plot(sta_rm_i(48001:96000),sta_rm_q(48001:96000))
% xlabel('time(s)'),ylabel('distance(cm)')
