################################################################################
#                               VARIABLES                                      #
################################################################################

RM = rm -rf

IMG_RM = docker rmi
BLD_DK = docker build -t
DK_COMPOSE = srcs/docker-compose.yml

PATH_NGINGX = srcs/requirements/nginx/.
PATH_MARIADB = srcs/requirements/mariadb/.
PARH_WORDPRESS = srcs/requirements/wordpress/.

################################################################################
#                               BOLD COLORS                                    #
################################################################################

END = \033[m
RED = \033[31m
GREEN = \033[32m
YELLOW = \033[33m
BLUE = \033[34m
PURPLE = \033[35m
CIAN = \033[36m

################################################################################
#  FONT                                                                        #
################################################################################

ligth = \033[1m
dark = \033[2m
italic = \033[3m

################################################################################
#                               MAKE RULES                                     #
################################################################################

all: up

up:
	@printf "$(ligth)Building Image [$(BLUE)nginx$(END)]\n"
	@$(BLD_DK) img-nginx $(PATH_NGINGX)
	@printf "$(ligth)Building Image [$(BLUE)mariadb$(END)]\n"
	@$(BLD_DK) img-mariadb $(PATH_MARIADB)
	@printf "$(ligth)Building Image [$(BLUE)wordpress & php$(END)]\n"
	@$(BLD_DK) img-wordpress $(PARH_WORDPRESS)
	@printf "$(ligth)Building [$(GREEN)docker-compose$(END)]\n"
	@docker compose --file $(DK_COMPOSE) up --detach

down:
	@printf "clear [$(GREEN)$(ligth)docker-compose$(END)]\n"
	@docker compose --file $(DK_COMPOSE) down
fdown:
	@printf "$(ligth)full clear [$(GREEN)docker-compose$(END)]\n"
	@docker compose --file $(DK_COMPOSE) down --volumes
	@printf "$(ligth)Clear Image [$(YELLOW)nginx$(END)]\n"
	@$(IMG_RM) img-nginx
	@printf "$(ligth)Clear Image [$(YELLOW)mariadb$(END)]\n"
	@$(IMG_RM) img-mariadb
	@printf "$(ligth)Clear Image [$(YELLOW)wordpress + php$(END)]\n"
	@$(IMG_RM) img-wordpress

.PHONY: all down fdown