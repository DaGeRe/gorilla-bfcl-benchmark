for model in ollama-llama3-3-70b vllm-deepseek-coder-33b-instruct vllm-deepseek-r1-distill-llama-70b vllm-llama-3-3-nemotron-super-49b-v1 vllm-llama-4-scout-17b-16e-instruct vllm-meta-llama-llama-3-3-70b-instruct vllm-mistral-small-24b-instruct-2501 vllm-nvidia-llama-3-3-70b-instruct-fp8
do
	python get_llm_responses.py \
		--api_key $TOKEN \
		--question_data eval-data/questions/huggingface/questions_huggingface_0_shot.jsonl \
		--openai_api_base https://kiara.sc.uni-leipzig.de/api \
		--model ollama-llama3-3-70b \
		--output_file output-$model.jsonl \
	       	--api_name huggingface \
		--parallel 10 &
done
wait
