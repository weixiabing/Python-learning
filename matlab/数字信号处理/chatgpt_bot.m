prompt = 'What is your question?\n'; % 提示用户输入问题
input_text = input(prompt,'s'); % 从命令行读取用户输入

url = 'https://api.openai.com/v1/engines/text-davinci-002/completions'; % OpenAI API的URL
api_key = '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'; % OpenAI API的密钥
max_tokens = 20; % 最大生成的令牌数

% 构造请求头
options = weboptions('KeyName','Authorization','KeyValue',['Bearer ' api_key]);

% 构造请求数据
data = sprintf('{"prompt":"%s","max_tokens":%d,"temperature":0.5}',input_text,max_tokens);

% 发送请求并获取响应
response = webwrite(url,'model',data,options);

% 获取生成的回答
answer = response.choices(1).text;

% 输出生成的回答
disp(answer);
