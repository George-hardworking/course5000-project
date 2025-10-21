% 清除工作区和图形
clear; clc; close all;

% 数据：按国家组织，行是国家，列是年份
data = [
    8634.30, 9430.40, 9634.00, 10039.40, 10022.30, 9933.40, 9902.90, 10123.50, 10387.90, 10654.50, 10826.60, 11477.30, 11397.00, 11547.00, 11570.10; % China
    5595.30, 5472.00, 5290.40, 5429.60, 5471.60, 5316.50, 5214.30, 5160.00, 5317.00, 5185.30, 4642.40, 4942.20, 5007.30, 4957.30, 4883.00; % USA
    3892.40, 3755.70, 3695.60, 3622.70, 3446.80, 3492.30, 3506.40, 3556.70, 3485.40, 3382.40, 3018.80, 3189.60, 3163.50, 2913.60, 2842.00; % EU
    1691.80, 1787.00, 1911.30, 1993.80, 2142.30, 2192.10, 2284.10, 2406.40, 2577.80, 2624.50, 2416.70, 2649.30, 2826.30, 2982.80, 3120.00  % India
];

% 国家名称（对应行）
countries = {'China', 'USA', 'EU', 'India'};

% 年份（对应列）
years = 2010:2024;

% 创建图形窗口
figure('Position', [100, 100, 1200, 800], 'Color', 'w');


colors = [
    0,    82,  147;
    41,  128,  185;
    86,  161,  212;
    142, 192,  235
] / 255;

% 绘制分组柱状图
h = bar(years, data', 'grouped'); % 注意：data 需要转置，因为 bar 默认按列绘图


% 应用自定义颜色
for i = 1:length(h)
    h(i).FaceColor = colors(i,:);
    h(i).EdgeColor = 'none';
end

% 设置柱子颜色（可选，更美观）
%colors = lines(4); % 使用 MATLAB 默认配色方案
%for i = 1:length(h)
    %h(i).FaceColor = colors(i,:);
   % h(i).EdgeColor = 'none'; % 去掉边框
%end

% 添加标题和坐标轴标签
%title('全球主要排放国二氧化碳排放数据图', 'FontSize', 16, 'FontWeight', 'bold', 'FontName', 'SimHei');
xlabel('年份', 'FontSize', 14, 'FontName', 'SimHei');
ylabel('CO₂ Emissions (MtCO₂)', 'FontSize', 14, 'FontName', 'SimHei');

% 设置 x 轴刻度为所有年份
xticks(years);
xticklabels(years);
xlim([min(years)-0.5, max(years)+0.5]);

% 添加图例
legend(countries, 'Location', 'best', 'FontSize', 12, 'Box', 'off');

% 添加网格
grid on;
grid minor;

% 设置字体（中文支持）
set(gca, 'FontName', 'Times New Roman', 'FontSize', 13);

% 设置标题和坐标轴标签（显式指定字体）
title('全球主要排放国二氧化碳排放数据图', ...
      'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('年份', 'FontName', 'Times New Roman', 'FontSize', 14);
ylabel('CO₂ 排放量 (MtCO₂)', 'FontName', 'Times New Roman', 'FontSize', 14);

% 设置图例字体（必须单独设置）
lgd = legend(countries, 'Location', 'southoutside', 'Orientation', 'horizontal');
set(lgd, 'FontName', 'Times New Roman', 'FontSize', 11)

% 美化布局
box off;
set(gcf, 'PaperSize', [8.27, 11.69]); % A4 尺寸
set(gcf, 'PaperPosition', [0, 0, 8.27, 11.69]);
set(gcf, 'PaperOrientation', 'landscape');

% 导出高清图像（可选）
% print('-dpng', '-r300', 'global_co2_emissions.png'); % PNG 格式，300 dpi
% print('-dpdf', 'global_co2_emissions.pdf');          % PDF 格式

% 显示图表
disp('✅ 图表已生成！请查看图形窗口。');