/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ajeannot <ajeannot@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/02/20 19:07:54 by ajeannot          #+#    #+#             */
/*   Updated: 2020/02/25 15:43:04 by ajeannot         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/libasm.h"

int ft_strcmp(char *s1, char *s2);

size_t		ft_strlen(const char *s)
{
	unsigned int	i;

	i = 0;
	while (s[i])
		i++;
	return (i);
}

char	*ft_strdup(const char *s)
{
	int		size;
	int		cmp;
	char	*new_string;

	cmp = 0;
	size = ft_strlen(s);
	new_string = malloc(sizeof(char) * (size + 1));
	if (new_string == NULL)
		return (0);
	while (cmp < size)
	{
		new_string[cmp] = s[cmp];
		cmp++;
	}
	new_string[cmp] = '\0';
	return (new_string);
}

int main()
{

    /* TESTS FT_ATOI_BASE_BONUS */
    printf("\033[1;32m");
    printf("\n========================================\n=========== FT_ATOI_BASE_BONUS =========\n========================================\n\n");
    printf("\033[0m");

	printf("---- OK -----\n");
	printf("Expected result = 369\nResult = %d\n\n", ft_atoi_base("369", "0123456789"));
	printf("Expected result = 565513\nResult = %d\n\n", ft_atoi_base("565513", "0123456789"));
	printf("Expected result = 15\nResult = %d\n\n", ft_atoi_base("1111", "01"));
	printf("Expected result = 128\nResult = %d\n\n", ft_atoi_base("--128", "0123456789"));
	printf("Expected result = -15\nResult = %d\n\n", ft_atoi_base("---1111", "01"));
	printf("Expected result = -128\nResult = %d\n\n", ft_atoi_base("-128", "0123456789"));
	printf("Expected result = 123\nResult = %d\n\n", ft_atoi_base("abcd", "abcdefghij"));
	printf("Expected result = 123\nResult = %d\n\n", ft_atoi_base("0123", "0123456789"));

	printf("---- ERREURS -----\n");
    printf("Expected result = 0\nResult = %d\n\n", ft_atoi_base("1236", "0123456189"));
    printf("Expected result = 0\nResult = %d\n\n", ft_atoi_base("565513", "-0123456789"));
    printf("Expected result = 0\nResult = %d\n\n", ft_atoi_base("123", "5"));
    printf("Expected result = 0\nResult = %d\n\n", ft_atoi_base("123", "01234 56789"));






    /* TESTS FT_LIST_PUSH_FRONT_BONUS */
    printf("\033[1;33m");
    printf("\n========================================\n======= FT_LIST_PUSH_FRONT_BONUS =======\n========================================\n\n");
    printf("\033[0m");

	int cmp_push;
	t_list *ptr_lst_push;
	t_list *browse_push;

	ptr_lst_push = NULL;
	printf("ADRESSE **begin_list = %p\n", &ptr_lst_push);
	printf("ADRESSE *begin_list = %p\n\n", ptr_lst_push);
	ft_list_push_front(&ptr_lst_push, ft_strdup("test 1"));

	cmp_push = 0;
	browse_push = ptr_lst_push;
	while (browse_push)
	{
		printf("\033[0;32m");
		printf("------- STRUCT %d -------\n", cmp_push);
		printf("\033[0m");
		printf("DATA = %s\n", browse_push->data);
		printf("NEXT = %p\n\n", browse_push->next);
		cmp_push++;
		browse_push = browse_push->next;
	}

	printf("\033[0;32m");
	printf("AJOUT DEUX ÉLÉMENTS DE LISTE\n\n");
	printf("\033[0m");
	ft_list_push_front(&ptr_lst_push, ft_strdup("test 2"));
	ft_list_push_front(&ptr_lst_push, ft_strdup("test 3"));

	cmp_push = 0;
	browse_push = ptr_lst_push;
	while (browse_push)
	{
		printf("\033[0;32m");
		printf("------- STRUCT %d -------\n", cmp_push);
		printf("\033[0m");
		printf("DATA = %s\n", browse_push->data);
		printf("NEXT = %p\n\n", browse_push->next);
		cmp_push++;
		browse_push = browse_push->next;
	}






    /* TESTS FT_LIST_SIZE_BONUS */
    printf("\033[1;36m");
    printf("\n========================================\n========== FT_LIST_SIZE_BONUS ==========\n========================================\n\n");
    printf("\033[0m");

	printf("Expected result = 3\nResult = %d\n\n", ft_list_size(ptr_lst_push));
	printf("Expected result = 0\nResult = %d\n", ft_list_size(NULL));





    /* TESTS FT_LIST_REMOVE_IF_BONUS */
    printf("\033[1;34m");
    printf("\n========================================\n======== FT_LIST_REMOVE_IF_BONUS =======\n========================================\n\n");
    printf("\033[0m");

	int cmp_remove;
	t_list *ptr_lst_remove;
	t_list *browse_remove;

	ptr_lst_push = NULL;
	printf("ADRESSE **begin_list = %p\n", &ptr_lst_remove);
	printf("ADRESSE *begin_list = %p\n", ptr_lst_remove);
	ft_list_push_front(&ptr_lst_remove, ft_strdup("data elem 1"));
	ft_list_push_front(&ptr_lst_remove, ft_strdup("data elem 2"));
	ft_list_push_front(&ptr_lst_remove, ft_strdup("data elem 3"));
	ft_list_push_front(&ptr_lst_remove, ft_strdup("data elem 2"));
	ft_list_push_front(&ptr_lst_remove, ft_strdup("data elem 1"));

	printf("\n\n---------------- INITIALE --------------\n\n");
	cmp_remove = 0;
	browse_remove = ptr_lst_remove;
	while (browse_remove)
	{
		printf("\033[0;32m");
		printf("------- STRUCT %d -------\n", cmp_remove);
		printf("\033[0m");
		printf("ADRESSE = %p\n", browse_remove);
		printf("DATA = %s\n", browse_remove->data);
		printf("NEXT = %p\n\n", browse_remove->next);
		cmp_remove++;
		browse_remove = browse_remove->next;
	}

	ft_list_remove_if(&ptr_lst_remove, "nothing remove", &ft_strcmp, &free);

	printf("\n\n---------- APRÈS NOTHING REMOVE ---------\n\n");
	cmp_remove = 0;
	browse_remove = ptr_lst_remove;
	while (browse_remove)
	{
		printf("\033[0;32m");
		printf("------- STRUCT %d -------\n", cmp_remove);
		printf("\033[0m");
		printf("ADRESSE = %p\n", browse_remove);
		printf("DATA = %s\n", browse_remove->data);
		printf("NEXT = %p\n\n", browse_remove->next);
		cmp_remove++;
		browse_remove = browse_remove->next;
	}

	ft_list_remove_if(&ptr_lst_remove, "data elem 1", &ft_strcmp, &free);

	printf("\n\n--------- APRÈS DATA ELEM 1 --------\n\n");
	cmp_remove = 0;
	browse_remove = ptr_lst_remove;
	while (browse_remove)
	{
		printf("\033[0;32m");
		printf("------- STRUCT %d -------\n", cmp_remove);
		printf("\033[0m");
		printf("ADRESSE = %p\n", browse_remove);
		printf("DATA = %s\n", browse_remove->data);
		printf("NEXT = %p\n\n", browse_remove->next);
		cmp_remove++;
		browse_remove = browse_remove->next;
	}

	ft_list_remove_if(&ptr_lst_remove, "data elem 2", &ft_strcmp, &free);

	printf("\n\n--------- APRÈS DATA ELEM 2 --------\n\n");
	cmp_remove = 0;
	browse_remove = ptr_lst_remove;
	while (browse_remove)
	{
		printf("\033[0;32m");
		printf("------- STRUCT %d -------\n", cmp_remove);
		printf("\033[0m");
		printf("ADRESSE = %p\n", browse_remove);
		printf("DATA = %s\n", browse_remove->data);
		printf("NEXT = %p\n\n", browse_remove->next);
		cmp_remove++;
		browse_remove = browse_remove->next;
	}






    /* TESTS FT_LIST_SORT_BONUS */
    printf("\033[1;35m");
    printf("\n========================================\n=========== FT_LIST_SORT_BONUS =========\n========================================\n\n");
    printf("\033[0m");

	int cmp_sort;
	t_list *ptr_lst_sort;
	t_list *browse_sort;

	ptr_lst_sort = NULL;
	printf("ADRESSE **begin_list = %p\n", &ptr_lst_sort);
	printf("ADRESSE *begin_list = %p\n", ptr_lst_sort);
	ft_list_push_front(&ptr_lst_sort, ft_strdup("CCC"));
	ft_list_push_front(&ptr_lst_sort, ft_strdup("ACB"));
	ft_list_push_front(&ptr_lst_sort, ft_strdup("BBB"));
	ft_list_push_front(&ptr_lst_sort, ft_strdup("CAC"));
	ft_list_push_front(&ptr_lst_sort, ft_strdup("AAA"));
	ft_list_push_front(&ptr_lst_sort, ft_strdup("BAC"));
	ft_list_push_front(&ptr_lst_sort, ft_strdup("BBB"));
	ft_list_push_front(&ptr_lst_sort, ft_strdup("CBB"));
	ft_list_push_front(&ptr_lst_sort, ft_strdup("AAA"));
	ft_list_push_front(&ptr_lst_sort, ft_strdup("BCA"));
	ft_list_push_front(&ptr_lst_sort, ft_strdup("CCA"));
	ft_list_push_front(&ptr_lst_sort, ft_strdup("BBC"));

	printf("\n\n---------------- INITIALE --------------\n\n");
	cmp_sort = 0;
	browse_sort = ptr_lst_sort;
	while (browse_sort)
	{
		printf("\033[0;32m");
		printf("------- STRUCT %d -------\n", cmp_sort);
		printf("\033[0m");
		printf("ADRESSE = %p\n", browse_sort);
		printf("DATA = %s\n", browse_sort->data);
		printf("NEXT = %p\n\n", browse_sort->next);
		cmp_sort++;
		browse_sort = browse_sort->next;
	}

	ft_list_sort(&ptr_lst_sort, &strcmp);

	printf("\n\n--------------- APRÈS TRI -------------\n\n");
	cmp_sort = 0;
	browse_sort = ptr_lst_sort;
	while (browse_sort)
	{
		printf("\033[0;32m");
		printf("------- STRUCT %d -------\n", cmp_sort);
		printf("\033[0m");
		printf("ADRESSE = %p\n", browse_sort);
		printf("DATA = %s\n", browse_sort->data);
		printf("NEXT = %p\n\n", browse_sort->next);
		cmp_sort++;
		browse_sort = browse_sort->next;
	}
}
