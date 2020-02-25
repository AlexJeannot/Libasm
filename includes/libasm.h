/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ajeannot <ajeannot@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/02/21 17:02:08 by ajeannot          #+#    #+#             */
/*   Updated: 2020/02/25 14:46:07 by ajeannot         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_BONUS_H
# define LIBASM_BONUS_H

# include <stdio.h>
# include <stdlib.h>
# include <unistd.h>
# include <stddef.h>
# include <string.h>
# include <fcntl.h>
# include <sys/types.h>

/* Structure utilisée pour les bonus */
typedef struct	s_list
{
	void			*data;
	struct s_list	*next;
}				t_list;

/* Prototype fonctions obligatoire*/
int 	ft_strcmp(char *s1, char *s2);
char 	*ft_strcpy(char *dest, const char *src);
char 	*ft_strdup(const char *s);
size_t	ft_strlen(const char *s);
ssize_t	ft_write(int fd, void const *buf, size_t nbyte);
ssize_t ft_read(int fd, void *buf, size_t count);

/* Prototype fonctions bonus*/
int		ft_atoi_base(char *str, char *base);
int		ft_list_size(t_list *begin_list);
void	ft_list_push_front(t_list **begin_list, void *data);
void 	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void*));
void 	ft_list_sort(t_list **begin_list,int (*cmp)());

#endif
