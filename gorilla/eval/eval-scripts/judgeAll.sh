for model in ollama-llama3-3-70b vllm-deepseek-coder-33b-instruct vllm-deepseek-r1-distill-llama-70b vllm-llama-3-3-nemotron-super-49b-v1 vllm-llama-4-scout-17b-16e-instruct vllm-meta-llama-llama-3-3-70b-instruct vllm-mistral-small-24b-instruct-2501 vllm-nvidia-llama-3-3-70b-instruct-fp8
do
	echo -n $model" & "
	python -W ignore::FutureWarning ast_eval_hf.py \
		--api_dataset ../../../data/api/huggingface_api.jsonl \
		--apibench ../../../data/apibench/huggingface_eval.json \
		--llm_responses ../output-$model.jsonl | grep "Function" | awk '{printf "%.2f\\\\ \\hline\n", $4*100}'
done | sort -k 3
