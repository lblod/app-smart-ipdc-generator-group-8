# AI Choices

## LLM Choice

When selecting a large language model (LLM) for our solution, the team evaluated several options, including the Llama 3 model by Meta (Facebook). While Llama 3 offers a state-of-the-art model, we opted for a European-developed LLM due to licensing concerns associated with Meta’s product. Additionally, Meta’s licensing terms for Llama 3 impose additional costs for commercial use.

Choosing a European LLM, more closely aligned with European regulatory frameworks and open licensing standards, presents a safer, more compliant alternative. Mistral-Nemo was selected as the preferred LLM for several reasons. First, Mistral-Nemo is developed within the European ecosystem, offering stronger compliance with European regulations. Mistral-Nemo adheres to European ethical standards for AI development, emphasizing transparency, fairness, and accountability. Additionally, Mistral-Nemo operates under the Apache License, simplifying its use in commercial environments.

During our tests, we discovered that Mistral-Nemo offers strong performance. However, we encountered some limitations, including the model’s inconsistent generation of text in a single language. Despite Sam and Ehran’s efforts to refine the model with precise prompts, this issue persisted. The final prompt that was used can be found at https://github.com/lblod/ai-service-smart-ipdc-generator-group-8/blob/89ab07c579d7ffc6ee13d979134e9c9c823c6e2c/src/llm/extract_cfg.py. Additional research is needed to identify potential solutions. For example, fine-tuning the model could improve its accuracy. More information on this topic can be found at https://github.com/mistralai/mistral-finetune/.

Although we selected the Mistral-Nemo model, we conducted tests with Llama3 for comparison. Llama3 produced better results for generating text in a single language, but its processing time was significantly longer compared to Mistral-Nemo.

## Custom Classification Model Choice

To create classifications for the generated product, we agreed to use a custom classification model insteal of an LLM. The advantages of this approach include:

- Improved accuracy
- Significantly faster processing times
- Significant cost savings

I don’t have personal experience building classification models. However, Joachim has extensive expertise in this area. Joachim selected "papluca/xlm-roberta-base-language-detection" as the classification model for the project. He explained that the model was pre-trained on a large multilingual dataset and fine-tuned on a language detection task. The model's architecture, based on XLM-RoBERTa, is well-suited for multilingual text classification tasks.

Joachim developed the original notebook for training the classification model, which was translated into a Python script by me. Both the notebook and the script are available in the repository found at https://github.com/lblod/ai-training-smart-ipdc-generator-group-8.

Additionally, Joachim provided the necessary GPU resources for training the model and created three classification models to categorize the product based on:

- type
- doelgroep
- thema

The dataset `producten_en_diensten_2024-09-13_21-47-37.csv` was utilized for both training and testing of the model. For the model evaluation, 15% of the dataset was allocated for testing purposes, while the remaining 85% was used for training. The results of the classification model evaluation were promising, with high accuracies for all classifiers.

Joachim also developed several projects to automate the deployment of these models using docker containers. These projects are available at:

- https://github.com/lblod/classifier-template-smart-ipdc-generator-group-8: a base template for deploying a model and utilize it through a REST API. Based on `mu-python-ml`.
- https://github.com/lblod/type-classifier-ipdc-generator-group-8: contains the type classifier model
- https://github.com/lblod/doelgroep-classifier-ipdc-generator-group-8: contains the doelgroep classifier model
- https://github.com/lblod/theme-classifier-ipdc-generator-group-8: contains the thema classifier model
