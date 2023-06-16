SRCS_DIR= srcs

NAME= magic

all : $(NAME)

$(NAME) : 
	cd $(SRCS_DIR) && \
	docker compose build && \
	docker compose up -d

re :
	make clean
	make all

clean :
	cd $(SRCS_DIR) && \
	docker compose down && docker system prune -a
	cd $(SRCS_DIR) && docker image rm $(docker container ls -aq)

.PHONY: all clean re
