/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ajeannot <ajeannot@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/02/25 12:00:06 by ajeannot          #+#    #+#             */
/*   Updated: 2020/02/25 16:22:13 by ajeannot         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/libasm.h"

int main()
{
    /* TESTS FT_STRLEN */
    printf("\033[1;32m");
    printf("\n========================================\n=============== FT_STRLEN ==============\n========================================\n\n");
    printf("\033[0m");
    printf("Expected result = %zu\nResult = %zu\n\n",strlen(""), ft_strlen(""));
    printf("Expected result = %zu\nResult = %zu\n\n",strlen("test"), ft_strlen("test"));
    printf("Expected result = %zu\nResult = %zu\n\n",strlen("test test test"), ft_strlen("test test test"));
    printf("Expected result = 0\nResult = %zu\n",    ft_strlen(NULL));


    /* TESTS FT_STRCPY */
    printf("\033[1;33m");
    printf("\n========================================\n=============== FT_STRCPY ==============\n========================================\n\n");
    printf("\033[0m");

    char dest[100];
    char dest_2[100];
    char dest_3[100];
    char dest_4[100];

    char dest_cmp[100];
    char dest_2_cmp[100];
    char dest_3_cmp[100];

    printf("Expected result = %s\nResult = %s\n\n", strcpy(dest_cmp, ""), ft_strcpy(dest, ""));
    printf("Expected result = %s\nResult = %s\n\n", strcpy(dest_2_cmp, "test"), ft_strcpy(dest_2, "test"));
    printf("Expected result = %s\nResult = %s\n\n", strcpy(dest_3_cmp, "test test test"), ft_strcpy(dest_3, "test test test"));
    printf("Expected result = (null)\nResult = %s\n\n", ft_strcpy(dest_4, NULL));
    printf("Expected result = (null)\nResult = %s\n",   ft_strcpy(NULL, "test"));


    /* TESTS FT_STRCPY */
    printf("\033[1;34m");
    printf("\n========================================\n=============== FT_STRCMP ==============\n========================================\n\n");
    printf("\033[0m");

    printf("Expected result = %d\nResult = %d\n\n", strcmp("", ""), ft_strcmp("", ""));
    printf("Expected result = %d\nResult = %d\n\n", strcmp("test", "test"), ft_strcmp("test", "test"));
    printf("Expected result = %d\nResult = %d\n\n", strcmp("AAA", "ABC"), ft_strcmp("AAA", "ABC"));
    printf("Expected result = %d\nResult = %d\n\n", strcmp("CCC", "ABC"), ft_strcmp("CCC", "ABC"));
    printf("Expected result = 1\nResult = %d\n\n",  ft_strcmp("test", NULL));
    printf("Expected result = -1\nResult = %d\n",   ft_strcmp(NULL, "test"));


    /* TESTS FT_STRDUP */
    printf("\033[1;31m");
    printf("\n========================================\n=============== FT_STRDUP ==============\n========================================\n\n");
    printf("\033[0m");

    printf("Expected result = %s\nResult = %s\n\n", strdup(""), ft_strdup(""));
    printf("Expected result = %s\nResult = %s\n\n", strdup("test"), ft_strdup("test"));
    printf("Expected result = %s\nResult = %s\n\n", strdup("test test test"), ft_strdup("test test test"));
    printf("Expected result = (null)\nResult = %s\n\n", ft_strdup(NULL));


    /* TESTS FT_READ */
    printf("\033[1;35m");
    printf("\n========================================\n================ FT_READ ===============\n========================================\n\n");
    printf("\033[0m");

    int fd;
    int fd_cmp;
    char buf[100];
    char buf_cmp[100];

    fd = open("files/file", O_RDONLY);
    fd_cmp = open("files/file_2", O_RDONLY);

    printf("Expected result = %zd\nResult = %zd\nBuf_cmp = %s\nBuf = %s\n\n", read(fd_cmp, buf_cmp, 12), ft_read(fd, buf, 12), buf_cmp, buf);
    printf("Expected result = %zd\nResult = %zd\nBuf_cmp = %s\nBuf = %s\n\n", read(-1, buf_cmp, 12), ft_read(-1, buf, 12), buf_cmp, buf);
    printf("Expected result = %zd\nResult = %zd\nBuf_cmp = %s\nBuf = %s\n\n", read(fd_cmp, NULL, 12), ft_read(fd, NULL, 12), buf_cmp, buf);
    printf("Expected result = %zd\nResult = %zd\nBuf_cmp = %s\nBuf = %s\n\n", read(fd_cmp, buf_cmp, -25), ft_read(fd, buf, -25), buf_cmp, buf);


    /* TESTS FT_WRITE */
    printf("\033[1;36m");
    printf("\n========================================\n=============== FT_WRITE ===============\n========================================\n\n");
    printf("\033[0m");

    printf("Expected result = %zd\nResult = %zd\n\n", write(1, "", 0), ft_write(1, "", 0));
    printf("Expected result = %zd\nResult = %zd\n\n", write(1, "test\n", 5), ft_write(1, "test\n", 5));
    printf("Expected result = %zd\nResult = %zd\n\n", write(1, "test test\n test\n", 10), ft_write(1, "test test\n test\n", 10));
    printf("Expected result = %zd\nResult = %zd\n\n", write(-25, "test\n", 5), ft_write(-25, "test\n", 5));
    printf("Expected result = %zd\nResult = %zd\n\n", write(1, "test\n", -25), ft_write(1, "test\n", -25));
    printf("Expected result = %zd\nResult = %zd\n\n", write(1, NULL, 5), ft_write(1, NULL, 5));

}
